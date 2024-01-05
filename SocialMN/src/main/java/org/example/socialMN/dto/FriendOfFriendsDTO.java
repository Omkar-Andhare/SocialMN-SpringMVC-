package org.example.socialMN.dto;

public class FriendOfFriendsDTO {

    public FriendOfFriendsDTO(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "FriendOfFriendsDTO{" +
                "username='" + username + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;
}
