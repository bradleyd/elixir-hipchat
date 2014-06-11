Hipchat
=======

a hipcaht library binding for elixir

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

Send a private message to a user

```elixir
client |> Hipchat.Users.message([user: "foo@example.com", message: "what's up!"])
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
