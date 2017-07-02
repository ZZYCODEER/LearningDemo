require('UIAlertView');
defineClass('ViewController', {
            clickAction: function() {
            var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("asdfa", null, self, "取消", "确定", null);
            alert.show();
            },
            });
