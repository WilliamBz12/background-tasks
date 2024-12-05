import 'package:flutter/material.dart';

import '../entities/shopping_item_entity.dart';
import 'check_item_widget.dart';
import 'separator_widget.dart';

class ListSectionWidget extends StatelessWidget {
  final String title;
  final List<ShoppingItemEntity> items;
  final Function(int) onToggleCompletion;
  final Function(int) onDeleteItem;
  final Function(int) onEditItem;
  final bool isFullyEmpty;

  const ListSectionWidget({
    super.key,
    required this.title,
    required this.items,
    required this.onToggleCompletion,
    required this.onDeleteItem,
    required this.onEditItem,
    this.isFullyEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return !isFullyEmpty
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                const SeparatorWidget(),
                const SizedBox(height: 16),
                const Text(
                  'Sua lista está vazia. Adicione itens a ela para não esquecer nada na próxima compra!',
                ),
              ],
            );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        const SeparatorWidget(),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ChecklistItemWidget(
              item: items[index],
              onChanged: (value) => onToggleCompletion(index),
              onDelete: () => onDeleteItem(index),
              onEdit: () => onEditItem(index),
            );
          },
        ),
      ],
    );
  }
}
