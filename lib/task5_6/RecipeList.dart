import 'package:bytewise/task5_6/recipeCard.dart';
import 'package:bytewise/task5_6/recipeDetails.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  RecipeList({Key? key}) : super(key: key);

  List<Map<String, String>> recipes = [
    {
      "title": 'Recipe 1',
      "image":
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
      "description": 'this is description for recipe 1'
    },
    {
      "title": 'Recipe 2',
      "image":
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      "description": 'this is description for recipe 2'
    },
    {
      "title": 'Recipe 3',
      "image":
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      "description": 'this is description for recipe 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Container(
        child: recipes.length != 0
            ? ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipeDetail(
                          ingredients: ["Ingrdient1", "Ingrdient2"],
                          steps: ["Step1", "Step2"],
                          title: recipes.elementAt(index)['title'] ?? "",
                          image: recipes.elementAt(index)['image'] ?? "",
                          description:
                              recipes.elementAt(index)['description'] ?? "",
                        );
                      }));
                    },
                    child: RecipeCard(
                      title: recipes.elementAt(index)['title'] ?? "",
                      image: recipes.elementAt(index)['image'] ?? "",
                      description:
                          recipes.elementAt(index)['description'] ?? "",
                    ),
                  );
                },
              )
            : Text('No Recipes'),
      ),
    );
  }
}
