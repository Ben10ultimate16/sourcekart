package com.Dao;
import com.model.*;


public interface UserDao {
public boolean insertUser(User user);
public User getUser(String userEmail);
}