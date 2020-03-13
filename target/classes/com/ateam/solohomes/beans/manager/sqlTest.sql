-- 신고당한 횟수 카운트
SELECT *
FROM member mb
	LEFT OUTER JOIN comment co ON mb.mb_uid = co.mb_uid
	LEFT OUTER JOIN co_report cr ON co.co_uid = cr.co_uid
;

SELECT co.co_uid co_uid, co.mb_uid, count(cr.re_uid) reportedNum
FROM comment co
	LEFT OUTER JOIN co_report cr ON co.co_uid = cr.co_uid
GROUP BY co.co_uid
;

SELECT *
FROM member mb
	LEFT OUTER JOIN (
		SELECT co.co_uid co_uid, co.mb_uid mb_uid, count(cr.re_uid) reportedNum
		FROM comment co
		LEFT OUTER JOIN co_report cr ON co.co_uid = cr.co_uid
		GROUP BY co.co_uid
	) re ON mb.mb_uid = re.mb_uid
;

SELECT mb.mb_uid uid, mb_id id, NVL(SUM(re.reportedNum), 0) reportedNum
FROM member mb
	LEFT OUTER JOIN (
		SELECT co.co_uid co_uid, co.mb_uid mb_uid, count(cr.re_uid) reportedNum
		FROM comment co
		LEFT OUTER JOIN co_report cr ON co.co_uid = cr.co_uid
		GROUP BY co.co_uid
	) re ON mb.mb_uid = re.mb_uid
GROUP BY mb.mb_uid
;

SELECT 
	mb.mb_uid uid, mb.mb_id id, mb.mb_nn nn,
	mb.mb_name name, mb.mb_phone phone, mb.mb_email email,
	mb.mb_zipcode zipcode, mb.mb_addr addr, mb.mb_addr2 addr2,
	mb.mb_regdate regdate, mb.mb_level level, IFNULL(SUM(re.reportedNum), 0) reportedNum
FROM member mb
	LEFT OUTER JOIN 
		(
			SELECT
				co.co_uid co_uid, co.mb_uid mb_uid, count(cr.re_uid) reportedNum
			FROM
				comment co
			LEFT OUTER JOIN
				co_report cr
				ON co.co_uid = cr.co_uid
			GROUP BY co.co_uid
		) re 
	ON mb.mb_uid = re.mb_uid
WHERE
	mb.mb_level = 1
GROUP BY
	mb.mb_uid
ORDER BY
	reportedNum DESC
LIMIT
	0, 5
;

-- 문의 + 아이디
SELECT 
	mb.mb_id id, rq.rq_uid uid,
	rq.rq_type 'type', rq.rq_subject subject, rq.rq_content content,  
	rq.rq_response response, rq.rq_regdate regdate
FROM member mb 
	JOIN request rq 
	ON rq.mb_uid = mb.mb_uid
ORDER BY 
	rq.rq_regdate DESC
;
SELECT 
	mb.mb_id id, rq.rq_uid uid,
	rq.rq_type 'type', rq.rq_subject subject, rq.rq_content content,  
	rq.rq_response response, rq.rq_regdate regdate
FROM member mb 
	JOIN request rq 
	ON rq.mb_uid = mb.mb_uid
WHERE 
	rq.rq_uid = 1;
;


-- 한줄평 가져오기
SELECT co.co_uid co_uid, co.mb_uid mb_uid, co.g_uid g_uid, 
	 co.co_subject subject, co.co_content content, co.co_regdate regdate, count(re.re_uid) reportedNum,
	 mb.mb_id mb_id, g.g_name g_name
FROM comment co
	LEFT OUTER JOIN co_report re ON co.co_uid = re.co_uid
	JOIN member mb ON co.mb_uid = mb.mb_uid
	JOIN goods g ON co.g_uid = g.g_uid
GROUP BY co.co_uid
ORDER BY reportedNum DESC
LIMIT 0, 5
;

-- 오늘 가입자 숫자 가져오기
SELECT count(*) FROM `member` m2 WHERE date_format(mb_regdate, '%Y-%m-%d') = CURDATE();

SELECT IFNULL(count(*), 0)
FROM 
	payment
WHERE 
	date_format(py_regdate, '%Y-%m-%d') = CURDATE()
;
SELECT SUM(IFNULL(py_amount * g.g_price, 0))
FROM 
	payment py
	JOIN goods_info gi ON py.in_uid = gi.in_uid
	JOIN goods g ON gi.g_uid = g.g_uid 
WHERE 
	date_format(py_regdate, '%Y-%m-%d') = CURDATE()
;

-- 월별 매출
SELECT mid(py_regdate, 1, 7) 'year_month', SUM(IFNULL(py_amount * g.g_price, 0)) amount
FROM 
	payment py
	JOIN goods_info gi ON py.in_uid = gi.in_uid
	JOIN goods g ON gi.g_uid = g.g_uid
GROUP BY 1
ORDER BY 1 DESC
;
SELECT * FROM (
SELECT mid(py_regdate, 1, 7) 'year_month', SUM(IFNULL(py_amount * g.g_price, 0)) amount
FROM 
	payment py
	JOIN goods_info gi ON py.in_uid = gi.in_uid
	JOIN goods g ON gi.g_uid = g.g_uid
GROUP BY 1
ORDER BY 1 DESC
LIMIT 0, 2) tb
ORDER BY 1 ASC
;

SELECT 
	g.g_uid g_uid,
	g.g_type g_type,
	g.g_name g_name,
	g.g_img g_img,
	IFNULL(g.g_size, "") g_size,
	g.g_price g_price,
	g.g_likecnt g_likecnt,
	IFNULL(tb.salNum, 0) salNum
FROM 
	goods g 
	LEFT OUTER JOIN (
		SELECT gi.g_uid g_uid, count(*) salNum
		FROM payment py 
		JOIN goods_info gi ON py.in_uid = gi.in_uid
		GROUP BY gi.g_uid
	) tb ON g.g_uid = tb.g_uid
;

SELECT gi.g_uid, count(*)
	FROM payment py 
	JOIN goods_info gi ON py.in_uid = gi.in_uid
GROUP BY gi.g_uid
;

SELECT 
	g.g_uid g_uid,
	g.g_type g_type,
	g.g_name g_name,
	g.g_img g_img,
	g.g_size g_size,
	g.g_price g_price,
	g.g_likecnt g_likecnt 
FROM 
	goods g 
	JOIN series_goods sg ON g.g_uid = sg.g_uid
WHERE sg.sr_uid = 1;