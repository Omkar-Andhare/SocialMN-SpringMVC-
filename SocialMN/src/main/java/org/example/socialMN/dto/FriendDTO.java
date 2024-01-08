package org.example.socialMN.dto;

public class FriendDTO {

    private String username;

    public FriendDTO() {

    }

    public FriendDTO(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "FriendDTO{" +
                "username='" + username + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
