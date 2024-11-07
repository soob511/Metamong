package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoSub1.SrmSequenceDao;
import com.mycompany.metamong.daoSub2.PmsSequenceDao;
import com.mycompany.metamong.daoSub3.HrSequenceDao;
import com.mycompany.metamong.dto.sequence.SequenceDto;

@Service
public class SequenceService {

	@Autowired
	private SrmSequenceDao srmSequenceDao;

	@Autowired
	private PmsSequenceDao pmsSequenceDao;

	@Autowired
	private HrSequenceDao hrSequenceDao;

	public List<SequenceDto> getSequenceList() {
		List<SequenceDto> SequenceList = new ArrayList<>();

		List<SequenceDto> srmSequence = srmSequenceDao.selectSequenceList();
		List<SequenceDto> pmsSequence = pmsSequenceDao.selectSequenceList();
		List<SequenceDto> hrSequence = hrSequenceDao.selectSequenceList();

		for (SequenceDto sequence : srmSequence) {
			sequence.setSchemaName("SRM");
			SequenceList.add(sequence);
		}

		for (SequenceDto sequence : pmsSequence) {
			sequence.setSchemaName("PMS");
			SequenceList.add(sequence);
		}

		for (SequenceDto sequence : hrSequence) {
			sequence.setSchemaName("HR");
			SequenceList.add(sequence);
		}

		return SequenceList;
	}

	/*
	 * public void searchSequence(String schema, String keyword) { if()
	 * 
	 * }
	 */

}
