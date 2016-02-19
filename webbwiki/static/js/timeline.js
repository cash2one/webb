/**
* @file timeline.js
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-06-17 09:16:50
**/
    function Timeline (outer, wrap, item, left, right, data) {
        this.$outer = $(outer);
        this.$wrap = $(wrap);
        this.item = item;
        this.$left = $(left);
        this.$right = $(right);
        this.icon = ['glyphicon-pencil', 'glyphicon-tag', 'glyphicon-time', 'glyphicon-search', 'glyphicon-picture'];
        this.data = data || [];
        this.totalLen = 0;
        this.start = 0;
        this.end = 0;
        this.html = '';
        this.typeList = [];
        this.init();
    }

    Timeline.prototype = {
        init: function () {
            var len = this.$outer.outerWidth();
            var data = this.data;
            var position = ['t', 'b'];
            var findEnd = false;
            var item = this.item.substring(1);
            var itemHead = item.substring(0, item.length - 4);
            for (var i = 0; i < data.length; i++) {
                this.html += '<div class="' + item + ' ' + itemHead + position[i%2] + ' ' + itemHead  + data[i].type + '">' +
                            '<div class="' + itemHead + 'content webb-animate webb-delay2">' + data[i].content + '</div>' +
                            '<div class="' + itemHead + 'icon webb-animate webb-delay1">' +
                                '<div class="' + itemHead + 'bg ' + itemHead + 'bg' + i%4 + '">' +
                                    '<i class="glyphicon ' + this.icon[i%5] + '" aria-hidden="true"></i>' +
                                '</div>' +
                            '</div>' +
                            '<div class="' + itemHead + 'time webb-animate webb-delay2">' + data[i].time + '</div>' +
                        '</div>';
                if (data[i].type === 'l') {
                    this.totalLen += 300;
                    this.typeList.push(300);
                }else if (data[i].type === 'm') {
                    this.totalLen += 220;
                    this.typeList.push(220);
                }else if (data[i].type === 's') {
                    this.totalLen += 140;
                    this.typeList.push(140);
                }
                if (!findEnd) {
                    if (this.totalLen <= len) {
                        this.end = i;
                    }else {
                        findEnd = true;
                    }
                }
            }
            this.bindEvent();
        },
        bindEvent: function () {
            var _this = this;
            this.$right.on('click', function () {
                if ($(this).attr('data-lock') === 'lock') {
                    return;
                }
                $(this).attr('data-lock', 'lock');
                _this.$left.attr('data-lock', 'lock');
                _this.next();
                $(this).attr('data-lock', 'unlock');
                _this.$left.attr('data-lock', 'unlock');
            });
            this.$left.on('click', function () {
                if ($(this).attr('data-lock') === 'lock') {
                    return;
                }
                $(this).attr('data-lock', 'lock');
                _this.$right.attr('data-lock', 'lock');
                _this.prev();
                $(this).attr('data-lock', 'unlock');
                _this.$right.attr('data-lock', 'unlock');
            });
        },
        parseData: function () {
            $(this.item).remove();
            this.$wrap.css('width', this.totalLen + 'px');
            this.$wrap.append(this.html);
            this.$outer.scrollLeft(0);
        },
        show: function () {
            var $items = $(this.item);
            for (var i = this.start; i <= this.end; i++) {
                $items.eq(i).find('.webb-animate').addClass('webb-animate-show');
            }
            this.checkArrow();
        },
        checkArrow: function () {
            if (this.$outer.scrollLeft() > 0) {
                this.$left.css('display', 'block');
            }else{
                this.$left.hide();
            }
            if (this.totalLen - this.$outer.scrollLeft() > this.$outer.outerWidth()) {
                this.$right.css('display', 'block');
            }else {
                this.$right.hide();
            } 
        },
        getWidth: function (s, e) {
            var width = 0;
            for (var i = s; i <= e; i++) {
                width += this.typeList[i];
            }
            return width;
        },
        getStartPosition: function (e) {
            var start = this.start;
            var len = this.$outer.outerWidth();
            var totalLen = 0;
            for (var i = e; i >= 0; i--) {
                totalLen += this.typeList[i];
                if (totalLen <= len) {
                    start = i;
                }else {
                    break;
                }
            }
            return start;
        },
        getEndPosition: function (s) {
            var end = this.end;
            var len = this.$outer.outerWidth();
            var totalLen = 0;
            for (var i = s; i < this.typeList.length; i++) {
                totalLen += this.typeList[i];
                if (totalLen <= len) {
                    end = i;
                }else {
                    break;
                }
            }
            return end;
        },
        anlysisStart: function () {
            var start = this.start;
            var len = this.$outer.outerWidth();
            var totalLen = 0;
            for (var i = start -1;i > 0; i--) {
                totalLen += this.typeList[i];
                if (totalLen <= len) {
                    start = i;
                    if (totalLen + this.typeList[this.start] > len) {
                        break;
                    }
                }
            }
            return start;
        },
        hideItem: function () {
            var $items = $(this.item);
            for (var i = 0;i < $items.length; i++) {
                if (i < this.start || i > this.end) {
                    $items.eq(i).find('.webb-animate').removeClass('webb-animate-show');
                }
            }
        },
        next: function () {
            var _this = this;
            var planWidth = this.getWidth(this.start, this.end);
            var leaveWidth = this.getWidth(this.end + 1, this.typeList.length - 1);
            if (planWidth > leaveWidth) {
                var newStart = this.getStartPosition(this.typeList.length -1);
                var newEnd = this.typeList.length -1;
                var planWidth = leaveWidth;
            }else {
                var newStart = this.end + 1;
                var newEnd = this.getEndPosition(this.end + 1);
            }
            this.$outer.animate({scrollLeft: this.$outer.scrollLeft() + planWidth}, 500, 'swing', function () {
                _this.start = newStart;
                _this.end = newEnd;
                _this.hideItem();
                _this.show();
            });
        },
        prev: function () {
            var _this = this;
            var leaveWidth = this.$outer.scrollLeft();
            var len = this.$outer.outerWidth();
            if (leaveWidth <= len) {
                var newStart = 0;
                var newEnd = this.getEndPosition(0);
                var planWidth = leaveWidth;
            }else {
                var newStart = this.anlysisStart();
                var newEnd = this.getEndPosition(newStart);
                var planWidth = this.getWidth(newStart, newEnd);
            }
            this.$outer.animate({scrollLeft: this.$outer.scrollLeft() - planWidth}, 500, 'swing', function () {
                _this.start = newStart;
                _this.end = newEnd;
                _this.hideItem();
                _this.show();
            });
        },
        destory: function () {
            $(this.item).remove();
            this.$left.hide().off('click');
            this.$right.hide().off('click');
        }
    }
