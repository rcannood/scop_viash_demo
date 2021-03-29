import unittest
import subprocess
import anndata as ad
from os import path

class TestDyngen(unittest.TestCase):
    def test_simple_clustering(self):
        out = subprocess.check_output([
              "./dyngen", "--output", "test.h5ad"]
            ).decode("utf-8")
       
        self.assertTrue(path.exists("test.h5ad"))
        
        data = ad.read_h5ad("test.h5ad")
        self.assertTrue(data.n_obs > 50)
        self.assertTrue(data.n_vars > 50)
        
unittest.main()
