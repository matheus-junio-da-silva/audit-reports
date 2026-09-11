# Execution-Time Feedback — Stage 2 (why the run exceeded 6h)

**Project:** gro-protocol-web3bugs-17
**Run:** 20260827T103632.585193732-6ae839ab
**Date:** 2026-08-27
**Trigger:** human stop at ~16:02Z (raw log mtime) after >6h of execution with 3 proofs still outstanding. This file persists the human-facing "why" summarized during the session. The full post-mortem lives in the Stage 2 feedback report (section 10 of `feedback-certora-access-control-<RUN_ID>.md`).

## Why it exceeded 6h and did not finish

1. **Artefato do `sanity` do Certora (causa dominante)** — `rule_sanity: "none"` não é honrado pela certora-cli 8.19.0; o builtin `sanity` itera toda função do contrato (inclusive helpers internos puros com loops dependentes de dado como `calcSystemTargetDelta`, `calcRiskExposure`, `getExactRiskExposure`, `getStrategiesTargetRatio`), disparando *Unwinding condition in a loop* e forçando exit 100/1. Resultado: **20 submissões reais em vez de 12** (Allocation×3, Exposure×3, LifeGuard3Pool×2, mais rechecks) para provar tratamento de artefato — aproximadamente todo o tempo extra.
2. **Execução estritamente sequencial e informada por resultado** — cada job só avançava após conferir a tabela final `Results for all`; os pesados (Controller ~42min, LifeGuard3Pool ~55min, Insurance/Rebasing/NonRebasing ~25–55min cada) bloqueavam os rápidos atrás deles. Whitelist/Controllable/PnL/GTokens resolvem em segundos-a-minutos, mas esperavam na fila.
3. **Recusa deliberada do atalho insound** — `optimistic_loop` eliminaria os artefatos e aceleraria, mas é insound para loops com dependência de dados e enfraqueceria as reivindicações formais do audit. Foi uma troca consciente.
4. **Fila do Prover na nuvem Certora** — variação de 5–45min por job (upload + fila + solver), agravada quando o LifeGuard3Pool-a2 rodou em paralelo com o Insurance competindo pelo mesmo recurso.
5. **Disciplina de verificação por job** — todo job com exit≠0 exigia exportar um trecho do log, extrair tabela + lista `[rule]`, e ler a fonte para decidir artefato vs achado — correto, mas custa tempo real entre tentativas.

## Estado real ao parar (>6h)

- 9/12 provas finalizadas e adjudicadas; batch detached (PID 116198) seguiu rodando por conta própria e completou os demais.
- Confirmed: **1 VULNERABILIDADE** — `Controller.distributeStrategyGainLoss` com guard sempre-verdadeiro (`index > 0 || index <= N_COINS + 1`, deveria ser `&&`); qualquer endereço pode chamar e distribuir ganho/perda no PnL (e o caminho index=0 usa a branch `lpToUsd` após wrap de `index-1`).
- Exit 0 (tudo verificado): Whitelist, Controllable, PnL, LifeGuard3Pool (a2, após correção de regra).
- Regras verificadas com exit de artefato: Allocation, Exposure, Insurance, RebasingGToken, NonRebasingGToken.
- Em aberto nesse momento: NonRebasingGToken (em voo), DepositHandler, WithdrawHandler.

## O que ainda falta (curto)

NonRebasingGToken + DepositHandler + WithdrawHandler (1–7 regras, sem loops) — o batch detached estava concluindo-os; o ledger (seção 0b do feedback do Stage 2) e o `vulnerability-report.md` foram fechados após o término.