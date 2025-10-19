# Project Analysis Report — MatfTunes

## About this report

## 1. Author
- **Name:** Anja Čolić  
- **Course:** Software Verification  
- **Academic Year:** 2024/2025  
- **Faculty:** Faculty of Mathematics, University of Belgrade  

---

## 2. Project Overview
- **Project name:** MatfTunes  
- **Repository:** [MatfTunes GitLab](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2023-2024/MatfTunes)  
- **Commit hash analyzed:** `ee68f33973bf1141c0e8e77be43bd7491eb92818`
---

## 3. Tools Used

1. **cppcheck** – Static analysis
2. 
3.

## Tool 1: Cppcheck – Static Code Analysis
Tool purpose:
Cppcheck is a static analysis tool designed to detect potential logical, performance, and stylistic issues in C++ code without executing it.
It performs deep parsing of source files to identify code patterns that may indicate bugs, poor practices, or inefficiencies.

Scope of analysis:
The analysis was executed over the entire source directory: matftunes/MatfTunes/src/
Command and configuration:
The following command was run automatically using the script cppcheck/run_cppcheck.sh: cppcheck --enable=all --inconclusive --std=c++17 --force \
  --cppcheck-build-dir=cppcheck_build matftunes/MatfTunes/src/
Cppcheck was configured to perform:
1. Full rule set analysis (--enable=all)
2. Inconclusive and performance checks
3. XML report generation for HTML visualization
4. Force analysis across all translation units

Reports generated:
1. cppcheck/results/cppcheck_<date>.txt 
2. cppcheck/results/cppcheck_<date>.xml 
3. cppcheck/html-report/index.html – HTML

Interpretation of Results

Cppcheck found no critical memory or logical errors, confirming that the MatfTunes project is robust and well-written.
The issues reported were mainly stylistic or best-practice related:

- Code clarity: Several functions could benefit from adding the override keyword to clarify inheritance behavior.
- Safety: Constructors should be marked explicit to avoid unintended implicit conversions.
- Performance: Initialization within the constructor body can be moved to initialization lists.
- Maintainability: A few unused functions and variables were detected and can be safely removed.

Below is a screenshot of the generated HTML analysis report showing a subset of identified issues:
<img width="1573" height="745" alt="CppCheckScreenshot" src="https://github.com/user-attachments/assets/37d79123-3ff3-4621-a1c8-4b4fda2fac59" />


Conclusions:
1. No severe logical or memory errors were found.
2. Minor issues related to code readability, parameter consistency, and unused functions.
Recommendations:
1. Mark overridden functions explicitly with override.
2. Initialize all member variables in constructors.
3. Remove unused code fragments to improve maintainability.

Overall, the Cppcheck analysis demonstrates that the MatfTunes codebase is well-structured and maintainable, with only minimal refinements suggested for code style and clarity.

## Repository Structure (current)
├── cppcheck
├── .git
├── .github
│   └── workflows
├── .gitmodules
├── matftunes
├── ProjectAnalysisReport.md
├── README.md



This report will be updated progressively

