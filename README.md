Hipchat
=======

A hipcaht API library for elixir

* This is a WIP and not all the functionalaity is here

#### Issues
* for some reason it double posts the message when private message to a user

What you will need:

* you personal token [here](https://sendgrid.hipchat.com/account/api)


## Usage

```elixir
client  = Hipchat.configure([token: "personal_token"]) #=> [token: "1234"]
```

Send a message to a room

```elixir
client |> Hipchat.Rooms.message([room_id: "test", message: "this is a test message", message_format: "text"])
```
OR 

```elixir
Hipchat.Rooms.message(client, [room_id: "test", message: "this is a test message", message_format: "text"])
```

Find a room
```elixir
client |> Hipchat.Rooms.find("test")
```

Find a user
```elixir
client |> Hipchat.Users.find("@foo")
```

Send a private message to a user

```elixir
client |> Hipchat.Users.message([user_id: "@foo", message: "what's up!"])
```

Fetch a list of all the rooms

```elixir
client |> Hipchat.Rooms.all
```

Fetch all the users

```elixir
client |> Hipchat.Users.all
```
  
* see [hipchat API documentation](https://www.hipchat.com/docs/apiv2)
