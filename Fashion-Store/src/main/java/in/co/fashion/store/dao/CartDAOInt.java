package in.co.fashion.store.dao;

import java.util.List;

import in.co.fashion.store.entity.CartEntity;

public interface CartDAOInt {

	public long add(CartEntity bean);
	
	public void update(CartEntity bean);
	
	public void delete(CartEntity bean);
	
	public CartEntity findByName(String name);
	
	public CartEntity findByPk(long id);
	
	public CartEntity findByProductAndUser(long prodId,long uId);
	
	public List<CartEntity> search(CartEntity bean, long pageNo, int pageSize);
	
	public List<CartEntity> search(CartEntity bean);
	
}
