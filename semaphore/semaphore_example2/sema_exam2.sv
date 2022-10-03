module semaphore_exa_get_try;

   semaphore car_key = new(1); 
   
   initial begin  
      repeat(2) begin      

      fork      

       begin   
          $display("person A Waiting for car, time=%0t", $time);        
          car_key.get(1); 
          $display("person A Got the car, time=%0t", $time);        
          #10;
          car_key.put(1);         
          $display("person A Returning back car, time=%0t", $time);  
       end 

       begin 
          #1;
          $display("person B Waiting for car, time=%0t", $time); 
          car_key.try_get(1); 
          $display("person B Got the car, time=%0t", $time); 
          #10;
          car_key.put(1); 
          $display("person B Returning back car, time=%0t", $time);  
       end 

     join

     $display();

   end  
  end

endmodule:semaphore_exa_get_try  
