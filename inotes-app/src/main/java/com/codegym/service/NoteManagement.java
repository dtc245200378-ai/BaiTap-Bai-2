package com.codegym.service;

import com.codegym.model.Note;
import com.codegym.model.NoteType;
import com.codegym.strategy.NoteDBStrategy;
import com.codegym.strategy.NoteStrategy;
import java.util.List;

public class NoteManagement {
    private NoteStrategy strategy;

    public NoteManagement() {
        // Mặc định sử dụng CSDL MySQL
        this.strategy = new NoteDBStrategy();
    }

    public NoteManagement(NoteStrategy strategy) {
        this.strategy = strategy;
    }

    public NoteStrategy getStrategy() {
        return strategy;
    }

    public void setStrategy(NoteStrategy strategy) {
        this.strategy = strategy;
    }

    public void addNote(String title, String content, int typeId) {
        Note note = new Note(title, content, typeId);
        this.strategy.save(note);
    }

    public void save(Note note) {
        this.strategy.save(note);
    }

    public boolean deleteNote(int id) {
        return this.strategy.delete(id);
    }

    public List<Note> searchNotes(String keyword) {
        return this.strategy.search(keyword);
    }

    public List<Note> findAll() {
        return this.strategy.findAll();
    }

    public Note getNoteById(int id) {
        return this.strategy.findById(id);
    }

    public List<NoteType> findAllTypes() {
        return this.strategy.findAllTypes();
    }
}
