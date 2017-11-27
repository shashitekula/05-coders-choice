# PasswordService


### Password Service Application

Password  Application components :

- Password Service 
- Password Store


###PasswordService
 - Application has simple_one_for_one strategy for store. It creates a map for
every user as its state.

##### PasswordService -  API

- PasswordService.create(newUserID, newPassword)

- PasswordService.login(userID, password)

- PasswordService.reset(userID, existingPassword, newPassword)

###PasswordStore
 - Application has state which is a list of all the maps created by the PasswordService
Application. 


### Execute Application

- $ cd password_service

#####* create new account -  
- $ PasswordService.create {"Shashi1var", "Shashi1var"}

#####* login to new account -  
- $ PasswordService.login {"Shashi1var", "Shashi1var"}
 
#####* reset to existing account -  
- $ PasswordService.login {"Shashi1var", "Shashi1var", "Shashi2var"}
 



