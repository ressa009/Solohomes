package com.ateam.solohomes.commnad;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Command {
	void execute(Model model);
}
