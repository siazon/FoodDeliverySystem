/**
 * 
 */
package com.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.dal.*;
import com.model.*;

/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-12-01 00:02:11
 * @version v1.0
 */
public class FoodDALTest {
	FoodDAL food;
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		food=new FoodDAL();
	}

	@Test
	public void testselectfood() {
		try {
			List<Food> list = food.selectAllFoods();
			assertEquals(2, list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
