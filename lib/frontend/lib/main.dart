import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const UniversidadApp());

class UniversidadApp extends StatelessWidget {
  const UniversidadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Universitario',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MateriasScreen(),
    );
  }
}

class MateriasScreen extends StatefulWidget {
  const MateriasScreen({super.key});

  @override
  State<MateriasScreen> createState() => _MateriasScreenState();
}

class _MateriasScreenState extends State<MateriasScreen> {
  List materias = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    obtenerMaterias();
  }

  Future<void> obtenerMaterias() async {
    // Usa '10.0.2.2' si estás probando en el emulador de Android de Android Studio
    // Usa tu IP local (ej: 'http://192.168.1.X:3000') si usas un dispositivo físico
    final url = Uri.parse('http://10.0.2.2:3000/api/materias');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          materias = json.decode(response.body);
          cargando = false;
        });
      }
    } catch (e) {
      print('Error al cargar materias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Materias y Clases'),
        backgroundColor: Colors.indigo,
      ),
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: materias.length,
              itemBuilder: (context, index) {
                final item = materias[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade100,
                      child: Text('${item['creditos']}CR', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    title: Text(item['nombre'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      style: const TextStyle(height: 1.3),
                      child: Text(
                        'Código: ${item['codigo']}\nDocente: ${item['profesor']}\nHorario: ${item['horario']}\nAula: ${item['aula']}',
                      ),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}