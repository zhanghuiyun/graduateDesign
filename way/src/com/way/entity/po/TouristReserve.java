package com.way.entity.po;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.way.entity.Reserve;

@Entity
@Table(name = "t_way_tourist_reserve")
public class TouristReserve {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(generator="idGenerator")
	@GenericGenerator(name="idGenerator", strategy="uuid")
	private String id;
	
	@ManyToOne(cascade = CascadeType.PERSIST, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "tourist_id")
	private Tourist tourist;
	
	@ManyToOne(cascade = CascadeType.PERSIST, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "reserve_id")
	private Reserve reserve;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Tourist getTourist() {
		return tourist;
	}

	public void setTourist(Tourist tourist) {
		this.tourist = tourist;
	}

	public Reserve getReserve() {
		return reserve;
	}

	public void setReserve(Reserve reserve) {
		this.reserve = reserve;
	}

	public TouristReserve(Tourist tourist, Reserve reserve) {
		super();
		this.tourist = tourist;
		this.reserve = reserve;
	}
	
	public TouristReserve(){};
}
