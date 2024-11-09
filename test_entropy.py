import entropy_core
import numpy as np
from scipy.stats import entropy

def test_entropy():
    # Генерируем случайное распределение вероятностей
    probs = np.random.dirichlet(np.ones(10), size=1)[0]
    cpp_entropy = entropy_core.vector_entropy(probs.tolist())
    scipy_entropy = entropy(probs, base=np.e)
    print(f"C++ entropy: {cpp_entropy}")
    print(f"Scipy entropy: {scipy_entropy}")
    assert np.isclose(cpp_entropy, scipy_entropy), "Entropy values do not match!"

if __name__ == "__main__":
    test_entropy()
