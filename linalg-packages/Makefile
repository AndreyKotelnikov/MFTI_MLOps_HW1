CXX = g++
CXXFLAGS = -std=c++11 -O3 -Wall $(shell python3 -m pybind11 --includes)
PY_LDFLAGS = $(shell python3-config --ldflags) -shared -fPIC
SRC_DIR = src
PYTHON_DIR = python

all: vector-entropy

vector-entropy: $(PYTHON_DIR)/bindings.o $(SRC_DIR)/entropy.o
	$(CXX) $^ -o $(PYTHON_DIR)/entropy_core$(shell python3-config --extension-suffix) $(PY_LDFLAGS)

$(PYTHON_DIR)/bindings.o: $(PYTHON_DIR)/bindings.cpp $(SRC_DIR)/entropy.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(SRC_DIR)/entropy.o: $(SRC_DIR)/entropy.cpp $(SRC_DIR)/entropy.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

clean:
	rm -f $(PYTHON_DIR)/*.o $(SRC_DIR)/*.o $(PYTHON_DIR)/entropy_core$(shell python3-config --extension-suffix)
