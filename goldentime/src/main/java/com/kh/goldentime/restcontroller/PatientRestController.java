package com.kh.goldentime.restcontroller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.vo.PatientPhoneNameVO;
import com.kh.goldentime.vo.ReservationDateStaffIdVO;
@CrossOrigin
@RestController
@RequestMapping("/rest")
public class PatientRestController {
	
	@Autowired
	private PatientDao dao;
	
	@PostMapping("/patient")
	public void insert(@RequestBody PatientDto dto) {
		dao.insert(dto);
	}
	
	@PutMapping("/patient")
	public boolean edit(@RequestBody PatientDto dto) {
		return dao.edit(dto);
	}

	@GetMapping("/patient")
	public List<PatientDto> list(){
		return dao.patientList();
	}
	
	@GetMapping("/patient/vo")
	public List<PatientDto> dateStaffList(@ModelAttribute PatientPhoneNameVO patientPhoneNameVO){
		return dao.patientConfirm(patientPhoneNameVO);
	}
	


}