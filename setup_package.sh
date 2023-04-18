#!/bin/bash

# Set up a new virtual environment and activate it
python3 -m venv venv
source venv/bin/activate

# Install necessary packages
pip install setuptools wheel twine

# Create package directories and files
mkdir betp-libv
touch betp-libv/__init__.py
touch setup.py
touch README.md
touch .gitignore

# Write content to .gitignore file
echo "venv/" >> .gitignore
echo "__pycache__/" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.pyo" >> .gitignore
echo "*.egg-info/" >> .gitignore
echo "dist/" >> .gitignore
echo "build/" >> .gitignore

# Write content to setup.py file
cat << EOF > setup.py
from setuptools import setup, find_packages

setup(
    name='betp-libv',
    version='0.1.0',
    description='A sample Python package',
    author='Puddl',
    author_email='devppong@gmail.com',
    url='https://github.com/devppong/betp-libv',
    packages=find_packages(),
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],
    python_requires='>=3.6',
)
EOF

# Write content to README.md file
echo "# betp-libv" >> README.md
echo "A sample Python package." >> README.md

# Commit the changes and push to the remote repository
git add .
git commit -m "Initial package setup"
git push origin main

# Build the package
python setup.py sdist bdist_wheel

# Test the package upload to TestPyPI (you'll need to have an account)
twine check dist/*
twine upload --repository-url https://test.pypi.org/legacy/ dist/* --verbose

# If everything looks good, you can upload the package to PyPI
# twine upload dist/*

# Deactivate the virtual environment
deactivate