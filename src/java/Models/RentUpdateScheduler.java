/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import DAL.DAO;
import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author Hieu
 */
public class RentUpdateScheduler {

    private Timer timer;

    public void scheduleUpdate(int rentId) {
        timer = new Timer();
        timer.schedule(new UpdateTask(rentId), 30 * 1000); // Schedule update after 3 days
    }

    public void cancelUpdate() {
        if (timer != null) {
            timer.cancel();
        }
    }

    private class UpdateTask extends TimerTask {

        private int rentId;

        public UpdateTask(int rentId) {
            this.rentId = rentId;
        }

        @Override
        public void run() {
            DAO.INSTANCE.updateRentEntity(2, null, null, rentId);
            System.out.println("Auto update query - 3 days passed");
            // Additional actions if needed after updating the query
        }
    }
}
