{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, bleak
, pyyaml
, voluptuous
, pytestCheckHook
, pytest-asyncio
, poetry-core
}:

buildPythonPackage rec {
  pname = "idasen";
  version = "0.9.5";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "newAM";
    repo = "idasen";
    rev = "refs/tags/v${version}";
    hash = "sha256-tjjoKUaX1v06I43TkkvKRHmd1rDuXqjEIHSTatbzyQk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    bleak
    pyyaml
    voluptuous
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-asyncio
  ];

  pythonImportsCheck = [
    "idasen"
  ];

  meta = with lib; {
    description = "Python API and CLI for the ikea IDÅSEN desk";
    homepage = "https://github.com/newAM/idasen";
    changelog = "https://github.com/newAM/idasen/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ newam ];
  };
}
