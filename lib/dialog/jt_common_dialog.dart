import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnDialogDismiss = void Function();

/// 通用对话框，支持纯文本（标题，内容）和自定义widget类型（标题，自定义内容）
///
/// 点击取消或者确认都会弹出对话框，使用时候无需关心对话框的pop事件，如果需要监听对话框的消失操作，
/// 可以定义onDialogDismiss回调方法。如对取消按钮有特殊操作需求，自定义onCancelClick（非必须）
class JTCommonDialog {
  bool showing;

  ///如果只定义了titleString或者contentString，但是没有定义对应的style，则使用下面的默认主题style
  ThemeData theme;
  DialogTheme dialogTheme;

  ///是否可以按物理返回键取消对话框
  final bool canCancelWithBack;

  ///取消按钮点击回调
  final OnDialogDismiss onCancelClick;

  ///确定按钮点击回调
  final OnDialogDismiss onConfirmClick;

  ///dialog消失回调,默认无
  final OnDialogDismiss onDialogDismiss;

  ///标题
  final String titleString;
  final TextStyle titleTextStyle;

  ///内容
  final String contentString;
  final TextStyle contentTextStyle;

  ///自定义内容Widget，可使用listview等滚动控件
  final Widget contentWidget;

  ///默认的取消文案
  final String cancelText;

  ///取消文案样式，如不设置，用默认
  final TextStyle cancelTextStyle;

  ///默认的确定文案
  final String confirmText;

  ///确定文案样式，如不设置，用默认
  final TextStyle confirmTextStyle;

  ///自定义widget时候需要指定padding，纯文本dialog不需要设置此属性
  final EdgeInsetsGeometry contentPadding;

  ///点击确认按钮是否关闭弹窗，默认可以关闭弹窗
  final bool canCloseWithConfirm;

  ///点击空白区域是否关闭弹窗，默认false不关闭
  final bool canCloseWithClickBlank;

  JTCommonDialog({
    this.titleString,
    this.titleTextStyle,
    this.contentString,
    this.contentTextStyle,
    this.contentWidget,
    this.cancelText,
    this.confirmText,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.onCancelClick,
    this.onConfirmClick,
    this.onDialogDismiss,
    this.canCancelWithBack = true,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.canCloseWithConfirm = true,
    this.canCloseWithClickBlank = false,
  });

  void show(BuildContext context) {
    showing = true;
    theme = Theme.of(context);
    dialogTheme = DialogTheme.of(context);
    showDialog<Null>(
      context: context,
      barrierDismissible: canCloseWithClickBlank,
      builder: (context) => WillPopScope(
        child: getDialogView(context),
        // ignore: missing_return
        onWillPop: () {
          if (canCancelWithBack) {
            if (onDialogDismiss != null) {
              onDialogDismiss();
            }
            showing = false;
            Navigator.of(context).pop();
          } else {
            return;
          }
        },
      ),
    );
  }

  void cancel(BuildContext context) {
    if (showing) {
      if (onCancelClick != null) {
        onCancelClick();
      }
      if (onDialogDismiss != null) {
        onDialogDismiss();
      }
      showing = false;
      Navigator.of(context).pop();
    }
  }

  void confirm(BuildContext context) {
    if (showing) {
      if (onConfirmClick != null) {
        onConfirmClick();
      }
      if (canCloseWithConfirm) {
        if (onDialogDismiss != null) {
          onDialogDismiss();
        }
        showing = false;
        Navigator.of(context).pop();
      }
    }
  }

  Widget getDialogView(BuildContext context) {
    if (contentWidget == null) {
      return AlertDialog(
        title: titleString != null
            ? Text(titleString, style: titleTextStyle)
            : null,
        content: Text(contentString ?? "", style: contentTextStyle),
        actions: <Widget>[
          cancelText != null
              ? FlatButton(
                  child: Text(
                    cancelText,
                    style: cancelTextStyle != null
                        ? cancelTextStyle
                        : TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  onPressed: () {
                    cancel(context);
                  },
                )
              : SizedBox(),
          confirmText != null
              ? FlatButton(
                  child: Text(
                    confirmText,
                    style: confirmTextStyle != null
                        ? confirmTextStyle
                        : TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  onPressed: () {
                    confirm(context);
                  },
                )
              : SizedBox(),
        ],
      );
    } else {
      return Dialog(
        child: Container(
          width: 270,
          constraints: BoxConstraints(maxHeight: 350),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              titleString != null
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                      child: DefaultTextStyle(
                        style: titleTextStyle ??
                            dialogTheme.titleTextStyle ??
                            theme.textTheme.title,
                        child: Semantics(
                          child: Text(
                            titleString,
                          ),
                          namesRoute: true,
                          container: true,
                        ),
                      ),
                    )
                  : SizedBox(),
              Flexible(
                child: Padding(padding: contentPadding, child: contentWidget),
              ),
              ButtonTheme(
                child: ButtonBar(
                  children: <Widget>[
                    cancelText != null
                        ? FlatButton(
                            child: Text(
                              cancelText,
                              style: cancelTextStyle != null
                                  ? cancelTextStyle
                                  : TextStyle(
                                      color: Colors.black, fontSize: 14),
                            ),
                            onPressed: () {
                              cancel(context);
                            },
                          )
                        : null,
                    confirmText != null
                        ? FlatButton(
                            child: Text(
                              confirmText,
                              style: confirmTextStyle != null
                                  ? confirmTextStyle
                                  : TextStyle(
                                      color: Colors.black, fontSize: 14),
                            ),
                            onPressed: () {
                              confirm(context);
                            },
                          )
                        : null,
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
