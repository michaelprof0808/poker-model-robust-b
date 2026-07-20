#!/usr/bin/env bash
set -euo pipefail
cd /opt/poker-model-robust-b
export PYTHONPATH=/opt/poker-model-robust-b
export POKER44_MODEL_PATH=${POKER44_MODEL_PATH:-/opt/poker-model-robust-b/models/poker-model-robust-b.joblib}
# HSP guard: native trained remap was selected for low FPR; keep batch-rank OFF unless emergency live FPR penalty appears.
export POKER44_BATCH_RANK=${POKER44_BATCH_RANK:-0}
export POKER44_BATCH_RANK_TARGET_FRACTION=${POKER44_BATCH_RANK_TARGET_FRACTION:-0.08}
export POKER44_BATCH_RANK_SPAN=${POKER44_BATCH_RANK_SPAN:-0.80}
export POKER44_EMERGENCY_TOPK=${POKER44_EMERGENCY_TOPK:-1}
export POKER44_EMERGENCY_TOPK_COUNT=${POKER44_EMERGENCY_TOPK_COUNT:-1}
export POKER44_EMERGENCY_TOPK_MIN_N=${POKER44_EMERGENCY_TOPK_MIN_N:-10}
export POKER44_MODEL_NAME=${POKER44_MODEL_NAME:-poker-model-robust-b}
export POKER44_MODEL_VERSION=${POKER44_MODEL_VERSION:-4.1-b}
export POKER44_MODEL_REPO_URL=${POKER44_MODEL_REPO_URL:-https://github.com/michaelprof0808/poker-model-robust-b}
export POKER44_MODEL_REPO_COMMIT=${POKER44_MODEL_REPO_COMMIT:-$(git -C /opt/poker-model-robust-b rev-parse HEAD 2>/dev/null || true)}
export POKER44_MODEL_ARTIFACT_SHA256=${POKER44_MODEL_ARTIFACT_SHA256:-8b340b5b3e5a240dfb526d91d661b0cb572809c1ca18f1aa8f743cbb36d9f06d}
exec /opt/poker-model-robust-b/.venv/bin/python neurons/miner.py --netuid 126 --wallet.name poker --wallet.hotkey sn126_2 --subtensor.network finney --neuron.name poker-model-robust-b --axon.port 8196 --blacklist.force_validator_permit
