/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author FES
 */
public interface ActivationControllerInterface {
    public abstract void requestActivation(String id);
    public boolean completeActivation(String id,String hash);
}
