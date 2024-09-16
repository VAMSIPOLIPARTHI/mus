CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE
);

CREATE TABLE Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INTEGER REFERENCES Artists(id)
);

CREATE TABLE Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    album_id INTEGER REFERENCES Albums(id),
    duration INTEGER NOT NULL
);

CREATE TABLE Playlists (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    name VARCHAR(100) NOT NULL
);

CREATE TABLE PlaylistTracks (
    playlist_id INTEGER REFERENCES Playlists(id),
    track_id INTEGER REFERENCES Tracks(id),
    PRIMARY KEY (playlist_id, track_id)
);

CREATE TABLE Payments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SubscriptionPlans (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE UserSubscriptions (
    user_id INTEGER REFERENCES Users(id),
    plan_id INTEGER REFERENCES SubscriptionPlans(id),
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP,
    PRIMARY KEY (user_id, plan_id)
);

CREATE TABLE Likes (
    user_id INTEGER REFERENCES Users(id),
    track_id INTEGER REFERENCES Tracks(id),
    PRIMARY KEY (user_id, track_id)
);
