/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.awt.Image;

/**
 *
 * @author FES
 */
public interface UploadControllerInterface {
    public abstract boolean Upload(String id, String path);
    public abstract Image Download(String id);
}
