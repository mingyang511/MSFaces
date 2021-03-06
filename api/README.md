# MSfaces API

At this stage there is neither login system nor authentication. To act as someone, simply attach the param u=<alias> to your request URI.

### POST /users
Flow for first time app startup. If alias already exists, add image to inventory and replace profile image. If alias doesn't exist yet, create a new user.
```
{
    "alias": "some_new_user"
    "profileImage": {
        "format": "jpg",
        "data": <base64 encoded image file>
    }
}
```
```
{
    "status": "OK"
}
```

### GET /users/t-dawei?u=t-dawei
Get basic info for a user.
```
{
    "status": "OK",
    "result": {
        "firstName": "Da",
        "lastName": "Wei",
        "profileImage": "relative/path/to/file"
    }
}
```

### GET /draw?u=t-dawei
Get an image to draw for.
```
{
    "status": "OK",
    "result": {
        "id": <string>,
        "path": <string>
    }
}
```

### POST /draw/imageId?u=t-dawei
Post a drawing for an image.
```
{
    "data": <drawing data string>,
    "faceType": 1
}
```
```
{
    "status": "OK",
    "result": {
        "score": 75
    }
}
```


### GET /guess?u=t-dawei
Start a guessing session.
```
{
    "status": "OK",
    "result": {
        "sessionId": <string>,
        "drawing": {
            "data": <drawing data string>,
            "faceType": 1
        },
        "choices": [{
            "alias": "t-dawei",
            "firstName": "Da",
            "lastName": "Wei"
        }, {
            "alias": "t-dawei",
            "firstName": "Da",
            "lastName": "Wei"
        }, {
            "alias": "t-dawei",
            "firstName": "Da",
            "lastName": "Wei"
        }, {
            "alias": "t-dawei",
            "firstName": "Da",
            "lastName": "Wei"
        }]
    }
}
```

### POST /guess/sessionId?u=t-dawei
Submit answer for a guessing session.
```
{
    "choice": 3
}
```
```
{
    "status": "OK",
    "result": {
        "isRightAnswer": true,
        "rightUser": {
            "alias": "t-dawei",
            "firstName": "Da",
            "lastName": "Wei",
            "profileImage": "/relative/path/to/file"
        }
        "score": 75
    }
}
```

### GET /leaderboard?u=t-dawei
Get data for the leaderboard view.
```
{
    "status": "OK",
    "result": {
        "draw": [{
            "profileImage": "relative/path/to/file",
            "alias": "first_place_person",
            "pts": 54321
        }, {
            "profileImage": "relative/path/to/file",
            "alias": "second_place_person",
            "pts": 43215
        }, {
            "profileImage": "relative/path/to/file",
            "alias": "third_place_person",
            "pts": 32154
        }],
        "guess": [{
            "profileImage": "relative/path/to/file",
            "alias": "first_place_person",
            "pts": 54321
        }, {
            "profileImage": "relative/path/to/file",
            "alias": "second_place_person",
            "pts": 43215
        }, {
            "profileImage": "relative/path/to/file",
            "alias": "third_place_person",
            "pts": 32154
        }],
        "myRankings": {
            "draw": 123,
            "guess": 123
        }
    }
}
```

### GET /collection?u=t-dawei&limit=12&offset=12
Get data for the collection view.
```
{
    "status": "OK",
    "result": {
        "users": [{
            "isNew": true,
            "profileImage": "relative/path/to/file",
            "firstName": "Da",
            "lastName": "Wei",
            "alias": "t-dawei"
        }],
        "revealed": 123,
        "total": 999
    }
}
```

### POST /collection/seen?u=t-dawei
Mark aliases as seen for the current user.
```
{
    "seen": ["t-dawei"]
}
```
```
{
    "status": "OK"
}
```
