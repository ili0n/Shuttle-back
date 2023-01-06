package com.shuttle.panic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shuttle.common.ListDTO;
import com.shuttle.ride.dto.RideDTO;
import com.shuttle.user.dto.UserDTO;


@RestController
@RequestMapping("/api/panic")
public class PanicController {
	@Autowired
	private IPanicService panicService;
	
	private PanicDTO from(Panic p) {
	    PanicDTO dto = new PanicDTO();
	    dto.setId(p.getId());
	    dto.setUser(new UserDTO(p.getUser()));
	  	dto.setRide(new RideDTO()); // TODO: convert
	    dto.setTime(p.getTime().toString());
	    dto.setReason(p.getReason());
	    
		return dto;
	}
	
	@PreAuthorize("hasAnyAuthority('admin')")
	@GetMapping
	public ResponseEntity<ListDTO<PanicDTO>> getNotifications() {
		List<Panic> panics = panicService.getAll();
		List<PanicDTO> panicsDTO = panics.stream().map(p -> from(p)).toList();
		return new ResponseEntity<>(new ListDTO<>(panicsDTO), HttpStatus.OK);
	}
}
