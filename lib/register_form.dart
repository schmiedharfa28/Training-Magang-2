import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController pass = TextEditingController();
  // TextEditingController agamaa = TextEditingController();
  String? agama;
  String? gender;
  GlobalKey<FormState> _keyForm = GlobalKey<
      FormState>(); //menambahkan validasi misal kalau add kosong keluar merah
//untuk gender
  void pilihGender(String? value) {
    setState(() {
      // untuk refresh value
      gender = value;
    });
  }

  List<String> listAgama = [
    'Islam',
    'Kristen Protestan',
    'Kristen Katolok',
    'Budha',
    'Hindu',
    'Konghucu'
  ];

  void pilihAgama(String? value) {
    // method untuk fungsi
    setState(() {
      agama = value;
    });
  }

//cara visibility
  bool hiden = true;
  void visible() {
    setState(() {
      hiden = !hiden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Register Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            //tambahkan ini duluan ya pas form baru masuk ke validator dibawah textformfiled
            //untuk memvalidasi
            key: _keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Fullname tidak boleh kosong" : null;
                  },
                  controller: fullname,
                  decoration: InputDecoration(
                    hintText: 'FullName',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Email tidak boleh kosong" : null;
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "No Telp tidak boleh kosong" : null;
                  },
                  controller: telp,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'No Telp',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Alamat tidak boleh kosong" : null;
                  },
                  controller: alamat,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.place),
                      hintText: 'Alamat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 8),

                //tambah agama dropdownbutton
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: agama,
                      hint: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Pilih Agama'),
                      ),
                      items: listAgama.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          pilihAgama(value);
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 8),
                //tambah gender
                Container(
                    child: Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: "Laki Laki",
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState( 
                            () {
                              pilihGender(value);
                            },
                          );
                        },
                        title: Text("Laki Laki"),
                        activeColor: Colors.green,
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        value: "Perempuan",
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(
                            () {
                              pilihGender(value);
                            },
                          );
                        },
                        title: Text("Perempuan"),
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                )),

                SizedBox(height: 8),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Password tidak boleh kosong" : null;
                  },
                  controller: pass,
                  keyboardType: TextInputType.visiblePassword,
                  // obscureText: true,
                  obscureText: hiden,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                            hiden ? Icons.visibility : Icons.visibility_off),
                        onPressed: visible,
                      ),
                      prefixIcon: Icon(Icons.lock_open),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: MediaQuery.of(context).size.width / 2,
                    color: Colors.amber,
                    textColor: Colors.white,
                    child: Text("Submit"),
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        // menambahkan validasi
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text("Informasi"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("FullName: ${fullname.text}"),
                                    Text("Email : ${email.text}"),
                                    Text("Telphone: ${telp.text}"),
                                    Text("Alamat  : ${alamat.text}"),
                                    Text("Password : ${pass.text}"),
                                    Text("Agama : $agama"),
                                    Text("Jenis Kelamin : $gender"),
                                  ],
                                ),
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Masih Ada yang Kosong")));
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
