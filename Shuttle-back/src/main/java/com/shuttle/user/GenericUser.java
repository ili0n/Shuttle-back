package com.shuttle.user;

import com.shuttle.credentials.Credentials;
import com.shuttle.note.Note;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor()
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class GenericUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    private Role role;
    private String name;
    private String surname;
    private String profilePicture;
    private String telephoneNumber;
    @OneToMany
    private List<Note> notifications;
    @OneToOne(cascade = CascadeType.ALL)
    private Credentials credentials;
    private String address;


}
