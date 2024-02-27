# EQ2401-Reduce-Periodic-Noise-in-Speech-Signal

## Introduction

This project focuses on reducing periodic noise in speech signals using various adaptive filtering algorithms. It includes implementations of the Least Mean Squares (LMS), Normalized Least Mean Squares (NLMS), and Recursive Least Squares (RLS) algorithms to denoise speech signals effectively.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Main Scripts](#main-scripts)
  - [Additional Scripts](#additional-scripts)
- [Features](#features)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)

## Installation

Instructions on how to install and set up your project. This section should include steps to clone the repository, install necessary dependencies, and any other setup required.

## Usage

### Main Scripts

- **main.m**: Uses LMS, NLMS, and RLS algorithms to denoise a speech signal. This is the primary script for the project.
- **main_notebook.mlx**: The live script version of `main.m`, providing a more interactive approach to the denoising process.

### Additional Scripts

- **extras.m**: Explores additional LMS-related algorithms beyond the main implementations.

## Features

- Denoising speech signals using adaptive filtering techniques.
- Implementation of LMS, NLMS, and RLS algorithms.
- Additional exploration of LMS-related algorithms.

## Project Structure

- **data/**: Contains documents and files related to the project.
- **functions/**: Houses core functions for the adaptive filter algorithms.
- **graphs/**: Includes graphs obtained from running `main.m`.
- **results/**: Stores denoised audio files after processing.
- **utils/**: Contains other self-defined functions necessary for running `main.m`.
- **Proj2_PPT**: Presentation slides related to the project.

## Dependencies

MATLAB R2022a
