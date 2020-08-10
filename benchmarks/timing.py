from dataclasses import dataclass
from pathlib import Path
from typing import Sequence, Dict, Optional


@dataclass
class RunTimeReport:
    """Class for keeping track of timing data"""
    input_conv_time: Optional[float]  # None if binaries found
    plane_reps: Sequence[Dict[str, float]]
    run_time: float
    save_path: str

    def save_report(self):
        with open(Path(self.save_path).joinpath('suite2p/runtime_report.txt'), 'w') as f:
            print(f'Input Conversion Time: {self.input_conv_time} seconds', file=f)
            for i, plane_dict in enumerate(self.plane_reps):
                print(f'Plane {i}', file=f)
                for key in plane_dict.keys():
                    print(f'{key} : {plane_dict[key]} seconds', file=f)
            print(f'Total Runtime: {self.run_time} seconds', file=f)