Name: SHASHI TEKULA           ID:   46739619

## Proposed Project

Initial would like like to develop for single user.

  PasswordManagement API that provides a programmatic interface to have the ability to
    1) Unlock
    2) Reset new with old password.

  PasswordManagement has interface as console and database as file.

  Later , I would like to enhance to support concurrent users.

## Outline Structure

GenServer
----------
Will introduce 2 GenServer(PasswordManager,PasswordLogServer) to have the ability to run concurrently.

PasswordManager - A GenServer, password_manager.ex is a client API to Unlock / Reset password

PasswordLogServer - A GenServer, password_lock.ex which handle synchronous request to reset password or unlock user and persist state into file.

Supervisors
-----------
I have structure my application with a two supervision trees to achieve high uptime. The key is to have successive GenServer to restarted in the event of an failure
with preferred Strategies :one_for_one
