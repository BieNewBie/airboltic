# Airboltic Data Model

## 📦 Dependency Management

This project uses [Poetry](https://python-poetry.org/) for managing dependencies, virtual environments, and packaging.

### 🔧 Prerequisites

Make sure you have Poetry installed:

```bash
pip install poetry
```

## Instructions

### 1. Clone the repo:

```bash
git clone https://github.com/BieNewBie/airboltic.git
cd airboltic
```

### 2.Install dependencies:

```bash
poetry install
```

### 3.Trigger virtual environment:
```bash
poetry shell
```


All dependencies are declared in pyproject.toml.


## Project Structure

```
airboltic/
├── pyproject.toml   # Poetry config and dependencies
├── airboltic/       # The dbt project where models are defined           
```