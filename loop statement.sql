delimiter $
CREATE FUNCTION IsPrime_while(n INT) RETURNS INT 
BEGIN
	DECLARE i INT DEFAULT 2 ;  
	DECLARE yn INT DEFAULT 1 ; 
 
	test:
	WHILE i<n DO
   	if n%i=0 THEN    
   		SET yn=0 ;    
   		LEAVE test ;   
   	END if ;   
   	SET i=i+1 ;       
	END WHILE test ; 
 
	RETURN yn ; 
END $
delimiter ; 

#SELECT IsPrime_while(2), IsPrime_while(3), IsPrime_while(9);


delimiter $
CREATE FUNCTION IsPrime_loop(n INT) RETURNS INT 
BEGIN
	DECLARE i INT DEFAULT 2 ;  
	DECLARE yn INT DEFAULT 1 ; 
 
	if n=2 then return yn ;    
	end if ;
	test: LOOP
   	if n%i=0 then    
      	set yn=0 ;   
      	leave test ;  
		end if ;
		set i=i+1 ;     
		IF i>=n THEN LEAVE test ;   
		END IF ;
	END LOOP test;
 
	RETURN yn ; 
END $
delimiter ; 

SELECT IsPrime_loop(2), IsPrime_loop(3), IsPrime_loop(9);


delimiter $
CREATE FUNCTION IsPrime_repeat(n INT) RETURNS INT 
BEGIN
	DECLARE i INT DEFAULT 2 ;  
	DECLARE yn INT DEFAULT 1 ; 
 
	if n=2 then return yn ;   
	end if ;
	test: REPEAT
		if n%i=0 then    
			set yn=0 ;    
			leave test ;   
		end if ;

		set i=i+1 ;      
	UNTIL i>=n
	END REPEAT test ;
 
	RETURN yn ; 
END $
delimiter ; 

SELECT IsPrime_repeat(2), IsPrime_repeat(3), IsPrime_repeat(9);