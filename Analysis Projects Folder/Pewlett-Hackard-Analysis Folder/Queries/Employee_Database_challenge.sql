------------------------------- Deliverable 1 -------------------------------
SELECT emp_no, first_name,last_name
FROM employees

SELECT title, from_date, to_date
FROM titles

SELECT t1.emp_no, first_name,last_name, title, from_date, to_date
INTO retirement_titles
FROM employees t1
INNER JOIN titles t2
ON t1.emp_no = t2.emp_no
WHERE t1.birth_date BETWEEN '1952-1-1' AND '1955-12-31'
ORDER BY t1.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

------------------------------- Deliverable 2 -------------------------------
SELECT emp_no, first_name,last_name,birth_date
FROM employees

SELECT from_date, to_date
FROM dept_emp

SELECT title
FROM titles

SELECT DISTINCT ON (t1.emp_no) t1.emp_no,
first_name,
last_name,
birth_date,
t2.from_date,
t2.to_date,
title
INTO mentorship_eligibilty
FROM employees t1
LEFT JOIN dept_emp t2
ON t1.emp_no = t2.emp_no
LEFT JOIN titles t3
ON t1.emp_no = t3.emp_no
WHERE t2.to_date = '9999-01-01' AND birth_date BETWEEN '1965-1-1' AND '1965-12-31'
ORDER BY emp_no;
