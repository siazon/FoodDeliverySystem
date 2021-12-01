package com.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.dal.*;
import com.model.UserAddress;
/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
public class AddressDALTest {
	AddressDAL address;

	@Before
	public void setUp() throws Exception {
		address = new AddressDAL();
	}

	@Test
	public void testselectAllAddress() {
		try {
			List<UserAddress> list = address.selectAllAddress();
			assertEquals(2, list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDeleteAddress() {
		try {
			assertTrue(address.deleteAddress(2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testUpdateAddress() {
		try {
			UserAddress useraddr = new UserAddress(0, "aa@ait.ie", "Ireland", "Willow", "101", "123");
			assertTrue(address.updateAddress(useraddr));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
