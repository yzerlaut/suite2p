from dataclasses import dataclass
from typing import Sequence, Dict, Optional


@dataclass
class TimeReport:
    """Class for keeping track of timing data"""
    input_conv_time: Optional[float]  # None if binaries found
    plane_reps: Sequence[Dict[str, float]]
    run_time: float
