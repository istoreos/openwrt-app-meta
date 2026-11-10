"""Keep application ownership out of metadata packages."""
from pathlib import Path
import json
import unittest

ROOT = Path(__file__).resolve().parents[1]


class MetadataRegistrationContractTest(unittest.TestCase):
    def test_metadata_packages_never_ship_application_registrations(self):
        for pkg in (ROOT / 'applications').glob('app-meta-*'):
            for file in (pkg / 'root').rglob('*'):
                if file.is_file() or file.is_symlink():
                    self.assertNotIn('apps.d', file.parts, str(file))
                    self.assertNotIn('desktop-apps.d', file.parts, str(file))
                    if file.suffix == '.json' and file.is_file():
                        self.assertNotIn('desktop', json.loads(file.read_text()), str(file))



if __name__ == '__main__':
    unittest.main()
