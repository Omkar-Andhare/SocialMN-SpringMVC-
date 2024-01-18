package org.example.socialMN.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(value = UserDataRetrievalException.class)
    public String handleUserDataRetrievalException(Model model) {
        model.addAttribute("msg", "UserDataRetrieval Exception has occurred");
        return "error";
    }

    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = AddFriendException.class)
    public String handleAddFriendException(Model model) {
        model.addAttribute("msg", "AddFriendException has occurred");
        return "error";
    }

    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(value = AreFriendsException.class)
    public String handleAreFriendsException(Model model) {
        model.addAttribute("msg", "AreFriendsException has occurred");
        return "error";
    }

    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = SignupValidationException.class)
    public String handleSignupValidationException(Model model) {
        model.addAttribute("msg", "SignupValidationException has occurred");
        return "error";
    }


}
