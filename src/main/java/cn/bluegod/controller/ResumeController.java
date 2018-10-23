package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.pojo.Resume;
import cn.bluegod.pojo.User;
import cn.bluegod.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-12 12:17
 * @Version V1.0
 */
@Controller
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @RequestMapping("/my_resume")
    @ResponseBody
    public BgResult getResume(HttpSession session){
        User user = (User) session.getAttribute("USER");
        return resumeService.getResumeByU_id(user.getId());
    }

    @RequestMapping("/admin/resume/{id}")
    @ResponseBody
    public BgResult getResumeById(@PathVariable Integer id){
        return resumeService.getResumeById(id);
    }

    @RequestMapping("/add_resume")
    @ResponseBody
    public BgResult addResume(HttpSession session, Resume resume){
        User user = (User) session.getAttribute("USER");
        resume.setuId(user.getId());
        return resumeService.addResume(resume);
    }

    @RequestMapping("/update_resume")
    @ResponseBody
    public BgResult updateResume(Resume resume){
        return resumeService.updateResume(resume);
    }
    @RequestMapping("/delete_resume")
    @ResponseBody
    public BgResult deleteResume(HttpSession session){
        User user = (User) session.getAttribute("USER");
        return resumeService.deleteResume(user.getId());
    }

}
