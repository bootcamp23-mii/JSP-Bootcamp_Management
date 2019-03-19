/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author Lusiana
 */
public interface SessionControllerInterface {

    public boolean user(String user);

    public boolean admin(String user);

    public boolean trainer(String user);

}
