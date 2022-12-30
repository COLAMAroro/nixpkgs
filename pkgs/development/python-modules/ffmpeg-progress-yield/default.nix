{ lib
, buildPythonPackage
, fetchPypi
, colorama
, tqdm
, pytestCheckHook
, ffmpeg
}:

buildPythonPackage rec {
  pname = "ffmpeg-progress-yield";
  version = "0.6.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-JLwvJcYcSe5Z7In34pQqHptd8TCrXJeJ6zPiGGv4T14=";
  };

  propagatedBuildInputs = [ colorama tqdm ];

  checkInputs = [ pytestCheckHook ffmpeg ];

  pytestFlagsArray = [ "test/test.py" ];

  pythonImportsCheck = [ "ffmpeg_progress_yield" ];

  meta = with lib; {
    description = "Run an ffmpeg command with progress";
    homepage = "https://github.com/slhck/ffmpeg-progress-yield";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ prusnak ];
  };
}
