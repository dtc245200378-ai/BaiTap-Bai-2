package com.codegym.strategy;

import com.codegym.model.Note;
import com.codegym.model.NoteType;
import java.io.*;
import java.util.*;

public class NoteFileStrategy implements NoteStrategy {
    private String filePath = "notes_storage.txt";

    public NoteFileStrategy() {
        File file = new File(filePath);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private List<Note> readAllFromFile() {
        List<Note> notes = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return notes;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|", -1);
                if (parts.length >= 4) {
                    int id = Integer.parseInt(parts[0]);
                    String title = parts[1].replace("\\n", "\n");
                    String content = parts[2].replace("\\n", "\n");
                    int typeId = Integer.parseInt(parts[3]);
                    Note note = new Note(id, title, content, typeId);
                    note.setTypeName(getTypeNameById(typeId));
                    notes.add(note);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notes;
    }

    private void writeAllToFile(List<Note> notes) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
            for (Note note : notes) {
                String safeTitle = note.getTitle().replace("\n", "\\n");
                String safeContent = note.getContent().replace("\n", "\\n");
                writer.write(note.getId() + "|" + safeTitle + "|" + safeContent + "|" + note.getTypeId());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String getTypeNameById(int typeId) {
        switch (typeId) {
            case 1: return "Cá nhân";
            case 2: return "Công việc";
            case 3: return "Học tập";
            default: return "Khác";
        }
    }

    @Override
    public void save(Note note) {
        List<Note> notes = readAllFromFile();
        if (note.getId() > 0) {
            for (int i = 0; i < notes.size(); i++) {
                if (notes.get(i).getId() == note.getId()) {
                    note.setTypeName(getTypeNameById(note.getTypeId()));
                    notes.set(i, note);
                    break;
                }
            }
        } else {
            int maxId = 0;
            for (Note n : notes) {
                if (n.getId() > maxId) maxId = n.getId();
            }
            note.setId(maxId + 1);
            note.setTypeName(getTypeNameById(note.getTypeId()));
            notes.add(0, note);
        }
        writeAllToFile(notes);
    }

    @Override
    public boolean delete(int id) {
        List<Note> notes = readAllFromFile();
        boolean removed = notes.removeIf(n -> n.getId() == id);
        if (removed) {
            writeAllToFile(notes);
        }
        return removed;
    }

    @Override
    public List<Note> findAll() {
        return readAllFromFile();
    }

    @Override
    public List<Note> search(String keyword) {
        List<Note> all = readAllFromFile();
        List<Note> result = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) return all;
        String lowerKey = keyword.toLowerCase();
        for (Note n : all) {
            if (n.getTitle().toLowerCase().contains(lowerKey) || n.getContent().toLowerCase().contains(lowerKey)) {
                result.add(n);
            }
        }
        return result;
    }

    @Override
    public Note findById(int id) {
        for (Note n : readAllFromFile()) {
            if (n.getId() == id) return n;
        }
        return null;
    }

    @Override
    public List<NoteType> findAllTypes() {
        List<NoteType> types = new ArrayList<>();
        types.add(new NoteType(1, "Cá nhân", "Ghi chú cá nhân"));
        types.add(new NoteType(2, "Công việc", "Ghi chú công việc"));
        types.add(new NoteType(3, "Học tập", "Ghi chú học tập"));
        return types;
    }
}
