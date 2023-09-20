import pytest
# from flask import c

@pytest.fixture(scope="class")
def mock_app():
    app = create_app({'TESTING': True})
