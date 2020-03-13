package com.ateam.solohomes;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.transaction.support.TransactionTemplate;

public class C {
	public static SqlSession sqlSession;
	public static TransactionTemplate transactionTemplate;
	public static JavaMailSender mailSender;
}
