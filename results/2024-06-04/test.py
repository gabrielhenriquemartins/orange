import os
from robot.api import ExecutionResult, ResultVisitor

class TestStatusCounter(ResultVisitor):
    def __init__(self):
        self.passed_tests = 0
        self.failed_tests = 0

    def visit_test(self, test):
        if test.status == 'PASS':
            self.passed_tests += 1
        elif test.status == 'FAIL':
            self.failed_tests += 1

def count_test_statuses(output_xml_path):
    result = ExecutionResult(output_xml_path)
    counter = TestStatusCounter()
    result.visit(counter)
    return counter.passed_tests, counter.failed_tests

if __name__ == "__main__":
    output_xml_path = 'output.xml'  # Caminho para o arquivo de saída do Robot Framework
    if os.path.exists(output_xml_path):
        passed, failed = count_test_statuses(output_xml_path)
        print(f"Número de testes que passaram: {passed}")
        print(f"Número de testes que falharam: {failed}")
    else:
        print(f"Arquivo {output_xml_path} não encontrado.")
