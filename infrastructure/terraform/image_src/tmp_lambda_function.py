import sys
from logging import INFO, StreamHandler, basicConfig, getLogger
from typing import Any

basicConfig(
    level=INFO,  # ログレベル
    format="%(asctime)s - %(levelname)s - %(message)s",
)

logger = getLogger(__name__)
stream_handler = StreamHandler()
stream_handler.setLevel(INFO)
logger.setLevel(INFO)
logger.addHandler(stream_handler)
logger.propagate = False
def handler(event: Any, context: Any) -> str:
    msg = f"Hello from AWS Lambda using Python {sys.version}!"
    logger.info(msg)
    return msg